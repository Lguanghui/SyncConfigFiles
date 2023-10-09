#  Copyright (c) 2023, Guanghui Liang. All Rights Reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

import git
import shutil
import os


dir_name = "ConfigFiles"


def read_cfg():
    lines = []
    cfg_file = open("files.cfg", "r")
    try:
        lines = cfg_file.readlines()
        lines = list(filter(lambda x: x != '\n', lines))
        lines = list(map(lambda x: x.rstrip('\n'), lines))
    finally:
        cfg_file.close()
        return lines


def copy_replace_files():
    if not os.path.exists(dir_name):
        os.makedirs(dir_name)
    files = read_cfg()
    for file in files:
        new_name = get_new_file_name(file)
        shutil.copyfile(file, new_name)


def get_new_file_name(file_name):
    new_name = file_name.split("/")[-1]
    return os.getcwd() + "/" + dir_name + "/" + new_name


def commit_changes():
    repo = git.Repo(".")
    if repo.is_dirty():
        repo.git.add(A=True)
        repo.git.commit("-m", "feat: sync files.")
    repo.git.push("--set-upstream", "origin", "main")


if __name__ == '__main__':
    copy_replace_files()
    commit_changes()
    print("文件同步完成！")
