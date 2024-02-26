from PyQt5.QtWidgets import QApplication, QWidget
from PyQt5.QtSql import QSqlTableModel
from ui.DepartmentManageUi import Ui_DepartmentManage
from database import DatabaseManager
from qfluentwidgets import Flyout, InfoBarIcon, FlyoutAnimationType, MessageBox


class DepartmentInterface(QWidget, Ui_DepartmentManage):
    def __init__(self, parent=None):
        super(DepartmentInterface, self).__init__(parent)
        self.setupUi(self)
        self.db_manager = DatabaseManager('data/hrmasterdb.db')  # 初始化你的数据库管理器
        self.initializeUI()
        self.PushButton.clicked.connect(self.quit_application)  # 假设有一个退出应用的方法
        self.PushButton_2.clicked.connect(self.submit_changes)  # 提交更改
        self.PushButton_3.clicked.connect(self.revert_changes)  # 恢复更改
        self.PushButton_4.clicked.connect(self.add_row)
        self.PushButton_5.clicked.connect(self.remove_row)

    def initializeUI(self):
        if self.db_manager.open_connection():
            self.model = QSqlTableModel(self)
            self.model.setTable('department')
            self.model.select()
            self.TableView.setModel(self.model)
        else:
            print("Database connection failed!")

    def closeEvent(self, event):
        self.db_manager.close_connection()

    def quit_application(self):
        self.close()

    def submit_changes(self):
        try:
            if self.model.submitAll():
                Flyout.create(
                    icon=InfoBarIcon.SUCCESS,
                    title='Success',
                    content="Changes submitted successfully.",
                    target=self.PushButton_2,  # Assume PushButton_2 is the submit button
                    parent=self,
                    isClosable=True,
                    aniType=FlyoutAnimationType.PULL_UP)
            else:
                raise Exception("Unknown error during submission.")
        except Exception as e:
            Flyout.create(
                icon=InfoBarIcon.ERROR,
                title='Error',
                content=f"Failed to submit changes: {str(e)}",
                target=self.PushButton_2,
                parent=self,
                isClosable=True,
                aniType=FlyoutAnimationType.PULL_UP)

    def revert_changes(self):
        try:
            self.model.revertAll()
            Flyout.create(
                icon=InfoBarIcon.SUCCESS,
                title='Success',
                content="Changes reverted successfully.",
                target=self.PushButton_3,  # Assume PushButton_3 is the revert button
                parent=self,
                isClosable=True,
                aniType=FlyoutAnimationType.PULL_UP)
        except Exception as e:
            Flyout.create(
                icon=InfoBarIcon.ERROR,
                title='Error',
                content=f"Failed to revert changes: {str(e)}",
                target=self.PushButton_3,
                parent=self,
                isClosable=True,
                aniType=FlyoutAnimationType.PULL_UP)

    def add_row(self):
        try:
            rowCount = self.model.rowCount()
            if self.model.insertRow(rowCount):
                self.model.submitAll()  # Optional: Remove if not immediately submitting
                Flyout.create(
                    icon=InfoBarIcon.SUCCESS,
                    title='Success',
                    content="Row added successfully.",
                    target=self.PushButton_4,  # Assume addButton is the add row button
                    parent=self,
                    isClosable=True,
                    aniType=FlyoutAnimationType.PULL_UP)
            else:
                raise Exception("Failed to add row.")
        except Exception as e:
            Flyout.create(
                icon=InfoBarIcon.ERROR,
                title='Error',
                content=f"Failed to add row: {str(e)}",
                target=self.PushButton_4,
                parent=self,
                isClosable=True,
                aniType=FlyoutAnimationType.PULL_UP)

    def remove_row(self):
        selectedIndexes = self.TableView.selectionModel().selectedRows()
        if not selectedIndexes:
            Flyout.create(
                icon=InfoBarIcon.WARNING,
                title='Warning',
                content="No row selected for deletion.",
                target=self.PushButton_5,  # 假定deleteButton是删除行的按钮
                parent=self,
                isClosable=True,
                aniType=FlyoutAnimationType.PULL_UP)
            return

        reply = MessageBox(
            'Confirm Deletion',
            "Are you sure you want to delete the selected row(s)?",
            self)

        if reply.exec():
            try:
                for index in sorted(selectedIndexes, reverse=True):
                    self.model.removeRow(index.row())
                self.model.submitAll()
                self.model.select()  # Refresh the view
                Flyout.create(
                    icon=InfoBarIcon.SUCCESS,
                    title='Success',
                    content="Row(s) removed successfully.",
                    target=self.PushButton_5,
                    parent=self,
                    isClosable=True,
                    aniType=FlyoutAnimationType.PULL_UP)
            except Exception as e:
                Flyout.create(
                    icon=InfoBarIcon.ERROR,
                    title='Error',
                    content=f"Failed to remove row: {str(e)}",
                    target=self.PushButton_5,
                    parent=self,
                    isClosable=True,
                    aniType=FlyoutAnimationType.PULL_UP)


if __name__ == "__main__":
    import sys

    app = QApplication(sys.argv)
    window = DepartmentInterface()
    window.show()
    sys.exit(app.exec_())
