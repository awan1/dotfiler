c.InteractiveShellApp.extensions = ['autoreload']
c.InteractiveShellApp.exec_lines = ['print "Running config lines in ~/.ipython/profile_default/ipython_config.py"',
                                    '%autoreload 2',
                                    'import sys',
                                    'import os',
                                    'import pandas as pd',
                                    'import ipdb']
