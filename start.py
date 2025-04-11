import subprocess
import concurrent.futures

def run_flutter():
    "V:\TCET\B.E\SEM 8\RBL 4\RBL-Project\lib\main.dart"
    main_dart_directory = r'./lib'
    subprocess.run(['flutter', 'run', '-d', 'emulator-5554'], cwd=main_dart_directory, check=True, shell=True)

def run_python_fsk():
    fsk_py_directory = r'./'
    subprocess.run(['python', 'fsk.py'], cwd=fsk_py_directory, check=True, shell=True)

with concurrent.futures.ThreadPoolExecutor() as executor: 
    future1 = executor.submit(run_flutter)
    future2 = executor.submit(run_python_fsk) 
    concurrent.futures.wait([future1, future2])