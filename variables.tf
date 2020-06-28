variable "module_create_user" {
  description = "Whether to create the IAM user"
  type        = bool
  default     = true
}

variable "module_create_iam_user_login_profile" {
  description = "Whether to create IAM user login profile"
  type        = bool
  default     = false
}

variable "module_create_iam_access_key" {
  description = "Whether to create IAM access key"
  type        = bool
  default     = false
}

variable "module_iam_user_name" {
  description = "Desired name for the IAM user"
  type        = string
}

variable "module_iam_user_path" {
  description = "Desired path for the IAM user"
  type        = string
  default     = "/"
}

variable "module_force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  type        = bool
  default     = false
}

variable "module_pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username. Used to encrypt password and access key."
  type        = string
  default     = ""
}

variable "module_password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on first login."
  type        = bool
  default     = false
}

variable "module_password_length" {
  description = "The length of the generated password"
  type        = number
  default     = 20
}

variable "module_upload_iam_user_ssh_key" {
  description = "Whether to upload a public ssh key to the IAM user"
  type        = bool
  default     = false
}

variable "module_ssh_key_encoding" {
  description = "Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM"
  type        = string
  default     = "SSH"
}

variable "module_ssh_public_key" {
  description = "The SSH public key. The public key must be encoded in ssh-rsa format or PEM format"
  type        = string
  default     = ""
}

variable "module_permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the user."
  type        = string
  default     = ""
}

variable "module_tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
