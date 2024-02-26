from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import pyqtSignal
from qfluentwidgets import Flyout, InfoBarIcon, FlyoutAnimationType
from ui.LoginWindowUi import Ui_LoginWindow


class LoginWindow(QtWidgets.QWidget):
    loginSuccess_ = pyqtSignal()
    loginFailed_ = pyqtSignal()
    showFlyout_ = pyqtSignal()
    on_login = False

    def __init__(self, parent=None):
        super(LoginWindow, self).__init__(parent)
        self.ui = Ui_LoginWindow()
        self.ui.setupUi(self)

        self.ui.PrimaryPushButton.clicked.connect(self.login)
        self.showFlyout_.connect(self.showFlyout)

    def login(self):
        username = self.ui.LineEdit.text()
        password = self.ui.PasswordLineEdit.text()
        if username == "admin" and password == "passwd":
            self.loginSuccess_.emit()
            self.on_login = True
            self.showFlyout_.emit()
        else:
            self.showFlyout_.emit()

    def showFlyout(self):
        if self.on_login:
            Flyout.create(
                icon=InfoBarIcon.SUCCESS,
                title='Login Success',
                content="Welcome to HR Manager",
                target=self.ui.PrimaryPushButton,
                parent=self,
                isClosable=False,
                aniType=FlyoutAnimationType.PULL_UP)
        else:
            Flyout.create(
                icon=InfoBarIcon.ERROR,
                title='Login Failed',
                content="Invalid username or password",
                target=self.ui.PrimaryPushButton,
                parent=self,
                isClosable=False,
                aniType=FlyoutAnimationType.PULL_UP)


if __name__ == "__main__":
    import sys

    app = QtWidgets.QApplication(sys.argv)
    loginWindow = LoginWindow()
    loginWindow.show()
    sys.exit(app.exec_())
