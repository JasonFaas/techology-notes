# Setting up Terraform on Mac
* Not a thorough guide, but a quick reference for a few common tasks

## New version of terraform
* Reminder to not upgrade beyond 1.5.7 due to change in license
* Download the desired version of terraform from the [official website](https://releases.hashicorp.com/terraform/)
  * Likely terraform_(version)_darwin_amd64.zip
* Unzip file
* Copy the binary to a directory in your PATH
  * `sudo cp terraform /usr/local/bin/`