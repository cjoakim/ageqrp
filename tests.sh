#!/bin/bash

# Execute the unit tests with code coverage.
# Chris Joakim, December 2024

source venv/bin/activate

echo 'reformatting source code with black ...'
black *.py
black ageqrp 
black tests

echo 'executing unit tests with code coverage ...'
pytest -v --cov=ageqrp/ --cov-report html tests/
