Start-Job -name "Python installing"  -ScriptBlock {
$PythonUrl = "https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe"
$PythonExe = "python-3.9.7-amd64.exe"
Invoke-WebRequest $PythonUrl -OutFile $PythonExe
$ArgumentList = "/quiet InstallAllUsers=0 TargetDir=`"$($Env:ProgramFiles)\Python39`""
Start-Process $PythonExe -ArgumentList $ArgumentList
Remove-Item $PythonExe
}

Start-Job -name "Environment  installing"  -ScriptBlock {
$AnacondaPath = "C:\ProgramData\anaconda3"
$AnacondaLibraryPath = "C:\ProgramData\anaconda3\Library"
$AnacondaScriptsPath = "C:\ProgramData\anaconda3\Scripts"
$env:Path = "$AnacondaPath;$AnacondaLibraryPath;$AnacondaScriptsPath;" + $env:Path
$env:Path
conda create -n smc python=3.9.7
conda activate smc
python -m pip install --upgrade pip
pip install jupyter notebook
pip install ipykernel
python -m ipykernel install --user --name smc --display-name smc
jupyter notebook
}

