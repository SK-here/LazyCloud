## Shared Configuration & Credentials Files

The AWS Provider can source credentials and other settings from the [shared configuration and credentials files](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html). 
By default, these files are located at `$HOME/.aws/config` and `$HOME/.aws/credentials` on Linux and macOS, and 
`"%USERPROFILE%\.aws\config"` and `"%USERPROFILE%\.aws\credentials"` on Windows.

If no named profile is specified, the default profile is used. Use the profile parameter or `AWS_PROFILE` environment variable to specify a named profile.

The locations of the shared configuration and credentials files can be configured using either the parameters `shared_config_files` and `shared_credentials_files` or the environment variables `AWS_CONFIG_FILE` and `AWS_SHARED_CREDENTIALS_FILE`.

**For example:**

```terraform
provider "aws" {
  shared_config_files      = ["/Users/tf_user/.aws/conf"]
  shared_credentials_files = ["/Users/tf_user/.aws/creds"]
  profile                  = "customprofile"
}
```

In this chapter I am going to create a docker instance for example.