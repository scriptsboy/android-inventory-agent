#!/usr/bin/env bash
#
#  LICENSE
#
#  This file is part of Flyve MDM Inventory Agent for Android.
#
#  Inventory Agent for Android is a subproject of Flyve MDM. Flyve MDM is a 
#  mobile device management software.
#
#  Flyve MDM Inventory Agent for Android is free software: you can redistribute 
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either version 3
#  of the License, or (at your option) any later version.
#
#  Flyve MDM Inventory Agent for Android is distributed in the hope that it will 
#  be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  ------------------------------------------------------------------------------
#  @author    Rafael Hernandez - <rhernandez@teclib.com>
#  @author    Naylin Medina    - <nmedina@teclib.com>
#  @copyright Copyright (c) Teclib'
#  @license   GPLv3 https://www.gnu.org/licenses/gpl-3.0.html
#  @link      https://github.com/flyve-mdm/android-mdm-dashboard/
#  @link      http://flyve.org/android-mdm-dashboard/
#  @link      https://flyve-mdm.com/
#  ------------------------------------------------------------------------------
#

# install transifex CLI
sudo apt-get -y install python-pip
sudo pip install transifex-client
sudo echo $'[https://www.transifex.com]\nhostname = https://www.transifex.com\nusername = '"$TRANSIFEX_USER"$'\npassword = '"$TRANSIFEX_API_TOKEN"$'\ntoken = '"$TRANSIFEX_API_TOKEN"$'\n' > ~/.transifexrc

# get transifex status
tx status

# push local files to transifex
tx push --source --no-interactive

# pull all the new language with 80% complete
tx pull --all --force

# # add all changes
# git add .
#
# # commit this changes
# git commit -m "ci(transifex): update locales files"
#
# git push origin $CIRCLE_BRANCH