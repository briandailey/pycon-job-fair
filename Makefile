
# Makefile for working with IPython notebook
NBNAME:= ./pycon_2014_job_fair_survey_analysis
IPYNB:= $(NBNAME).ipynb

default: runipy

setup:
	# pip install virtualenvwrapper
	# mkvirtualenv <name>
	python -c 'import conda' || pip install conda
	conda install numpy pandas matplotlib ipython-notebook && \
	pip install seaborn runipy

html:
	ipython nbconvert $(IPYNB) --to html

markdown:
	# Note: pandas.DataFrame.to_html does not output as a Markdown table
	ipython nbconvert $(IPYNB) --to markdown 

run-notebook:
	ipython notebook --secure --ip=127.0.0.1 --notebook-dir=. --no-mathjax

clean:
	rm -rf $(NBNAME).md $(NBNAME).html $(NBNAME)_files/

runipy:
	runipy -o $(IPYNB)
