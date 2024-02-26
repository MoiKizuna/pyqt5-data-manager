import sys
from PyQt5.QtWidgets import QApplication, QWidget
from PyQt5.QtCore import Qt
from LoginWindow import LoginWindow
from MainWindow import MainWindow

if __name__ == "__main__":
    app = QApplication(sys.argv)

    login_window = LoginWindow()
    main_window = MainWindow()


    def show_main_window():
        main_window.show()
        login_window.close()


    login_window.loginSuccess.connect(show_main_window)

    login_window.show()

    sys.exit(app.exec_())
