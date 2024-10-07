# Используем базовый образ Jupyter
FROM jupyter/base-notebook:latest

# Устанавливаем необходимые библиотеки
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Настройка пароля для JupyterLab
RUN echo "c.NotebookApp.password = u'sha1:your_hashed_password_here'" >> /home/jovyan/.jupyter/jupyter_notebook_config.py

# Открываем порт для доступа
EXPOSE 8888

# Запускаем JupyterLab
CMD ["start-notebook.sh", "--NotebookApp.token=''"]