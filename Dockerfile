FROM gikoluo/python

COPY doc/requirements.txt /tmp/requirements.txt

RUN pip3 install -r /tmp/requirements.txt

ADD . /var/www/codo-cron/

# 6. 初始化生成表结构
# RUN python3 /var/www/codo-cron/db_sync.py

# 7. 日志
VOLUME /var/log/

# 8. 准备文件
COPY doc/supervisor_ops.conf  /etc/supervisord.conf

EXPOSE 9900
CMD ["/usr/bin/supervisord"]