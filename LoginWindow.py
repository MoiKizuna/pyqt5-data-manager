from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import pyqtSignal
from ui.LoginWindowUi import Ui_LoginWindow


class LoginWindow(QtWidgets.QWidget):
    loginSuccess = pyqtSignal()

    def __init__(self, parent=None):
        super(LoginWindow, self).__init__(parent)
        self.ui = Ui_LoginWindow()
        self.ui.setupUi(self)

        self.ui.PrimaryPushButton.clicked.connect(self.login)

    def login(self):
        username = self.ui.LineEdit.text()
        password = self.ui.PasswordLineEdit.text()
        if username == "admin" and password == "admin":
            self.loginSuccess.emit()


if __name__ == "__main__":
    import sys

    app = QtWidgets.QApplication(sys.argv)
    loginWindow = LoginWindow()
    loginWindow.show()
    sys.exit(app.exec_())
