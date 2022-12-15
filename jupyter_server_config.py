# -*- coding: utf-8 -*-
# Configuration file for JupyterLab


import os
import traceback
from notebook.auth import passwd


try:
    c.ServerApp.ip = "*"
    c.ServerApp.open_browser = False
    if os.environ["JUPYTERLAB_PASSWORD_PROTECT"] == "True":     # password required mode
        password = os.environ["JUPYTERLAB_PASSWORD"]
        c.ServerApp.password = passwd(password)
    elif os.environ["JUPYTERLAB_PASSWORD_PROTECT"] == "False":   # token required mode
        c.ServerApp.password_required = False
    else:                                                      # Open mode
        c.ServerApp.token = ""
        c.ServerApp.password = ""
        c.ServerApp.allow_password_change = False # This can be set to false to prevent changing password from the UI/API.

except Exception as e:
    traceback.print_exc()
    exit(-1)
