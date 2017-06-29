c.InteractiveShellApp.extensions = ['autoreload']
c.InteractiveShellApp.exec_lines = [
'''
print("Running config lines in ~/.ipython/profile_default/ipython_config.py")
%autoreload 2
import sys
import os
import numpy as np
import pandas as pd
import ipdb
import logging
import matplotlib.pyplot as plt

def _set_log_level(level):
    """
    Set logging level. Other methods (sys.argv, argparse) break with iPython.
    """
    level_options = ['DEBUG', 'INFO', 'WARN', 'ERROR', 'CRITICAL']
    if level not in level_options:
        print("Choose from {}".format(level_options))
        return
    reload(logging)
    log_format="%(levelname)s:%(name)s:%(asctime)s] %(message)s"
    logging.basicConfig(format=log_format, level=getattr(logging, level))
    print("Success!")
print("Suggest running _set_log_level(level)")
'''
]
