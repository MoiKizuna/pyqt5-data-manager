from PyQt5.QtWidgets import QApplication, QWidget
from PyQt5.QtSql import QSqlTableModel
from ui.EmployeesManageUi import Ui_EmployeesManage
from database import DatabaseManager


class EmployeesInterface(QWidget, Ui_EmployeesManage):
    def __init__(self, parent=None):
        super(EmployeesInterface, self).__init__(parent)
        self.setupUi(self)
        self.db_manager = DatabaseManager('data/hrmasterdb.db')  # 初始化你的数据库管理器
        self.initializeUI()

    def initializeUI(self):
        if self.db_manager.open_connection():
            self.model = QSqlTableModel(self)
            self.model.setTable('employee')
            self.model.select()
            self.TableView.setModel(self.model)
        else:
            print("Database connection failed!")

    def closeEvent(self, event):
        self.db_manager.close_connection()


if __name__ == "__main__":
    import sys

    app = QApplication(sys.argv)
    window = EmployeesInterface()
    window.show()
    sys.exit(app.exec_())
