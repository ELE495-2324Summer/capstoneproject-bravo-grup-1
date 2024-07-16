import nbformat
from nbconvert.preprocessors import ExecutePreprocessor, CellExecutionError

def run_notebook(notebook_path):
    with open(notebook_path,'r', encoding='utf-8') as f:
        nb = nbformat.read(f, as_version=4)

    ep = ExecutePreprocessor(timeout=600, kernel_name='python3')

    try:
        ep.preprocess(nb, {'metadata': {'path': '.'}})
    except CellExecutionError as e:
        print(f"Error executing the notebook: {e}")
        raise

# Notebook dosyasının yolunu belirleyin
notebook_path = 'main.ipynb'  # Çalıştırmak istediğiniz notebook'un yolu

# Notebook'u çalıştır
run_notebook(notebook_path)