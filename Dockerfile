# 使用官方 Python 运行时作为父镜像
FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 复制依赖文件并安装
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 复制应用程序代码
COPY . .

# 暴露端口
EXPOSE 5000

# 运行应用
CMD ["python", "app.py"]

# 推荐的生产环境启动方式
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
