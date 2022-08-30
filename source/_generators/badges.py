import pandas as pd
from jinja2 import Template, FileSystemLoader, select_autoescape, Environment
import pathlib
from os.path import sep, join, exists, getmtime
from os import mkdir
import sys
import json
template_folders = ['Introduction', 'Applied Mathematics', 'Data Manipulation']
# loader = FileSystemLoader(template_folders)
# env = Environment(loader=loader,     autoescape=select_autoescape(['html', 'xml']))

git_repo = "ffraile/computer_science_tutorials"
branch = "main"
path_to_template_folders = "source"
if __name__ == '__main__':
    for template_folder in template_folders:
        for template_file in pathlib.Path('../' + template_folder).glob('**/*.ipynb'):
            colabs_file_name = "/".join(template_file.parts[1:]).replace(" ", "%20")
            binder_file_name = "%2F".join(template_file.parts[1:]).replace(" ", "%20")
            badges = "## Try me\\n\"," +\
                     "\"[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/{0}/blob/{1}/{2}/{3})".format(git_repo, branch, path_to_template_folders, colabs_file_name) +\
                     "[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/{0}/{1}?labpath={2}%2F{3})".format(git_repo, branch, path_to_template_folders.replace("/","%2F"), binder_file_name)

            with open(template_file, 'r', encoding="utf8") as in_file:
                try:
                    file_content = in_file.read()
                except UnicodeDecodeError as e:
                    print("UnicodeDecodeError in file: {0}".format(template_file.absolute()))
                    print(e)

                if file_content.find("{{ badges }}") < 0:
                    continue
                file_content = file_content.replace("{{ badges }}", badges)
                # template = Template(in_file.read())
                # file_content = template.render(badges=badges)
                in_file.close()

            # print(template_file)
            # print(file_content)
            with open(template_file, 'w', encoding="utf8") as out_file:
                out_file.write(file_content)
                out_file.close()