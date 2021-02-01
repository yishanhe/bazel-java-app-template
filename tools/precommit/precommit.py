#!/usr/bin/env python
import sys
import os
from pre_commit.main import main
if __name__ == '__main__':
    print(os.path.abspath(__file__))
    sys.exit(main())
