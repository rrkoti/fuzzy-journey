resource "aws_iam_user" "this" {
  count = var.module_create_user ? 1 : 0
  name                 = var.module_iam_user_name
  path                 = var.module_iam_user_path
  force_destroy        = var.module_force_destroy
  permissions_boundary = var.module_permissions_boundary
  tags                 = var.module_tags
}

resource "aws_iam_user_login_profile" "this" {
  count = var.module_create_user && var.module_create_iam_user_login_profile ? 1 : 0
  user                    = aws_iam_user.this[0].name
  pgp_key                 = var.module_pgp_key
  password_length         = var.module_password_length
  password_reset_required = var.module_password_reset_required
}

resource "aws_iam_access_key" "this" {
  count = var.module_create_user && var.module_create_iam_access_key && var.module_pgp_key != "" ? 1 : 0
  user    = aws_iam_user.this[0].name
  pgp_key = var.module_pgp_key
}

resource "aws_iam_access_key" "this_no_pgp" {
  count = var.module_create_user && var.module_create_iam_access_key && var.module_pgp_key == "" ? 1 : 0
  user = aws_iam_user.this[0].name
}

resource "aws_iam_user_ssh_key" "this" {
  count = var.module_create_user && var.module_upload_iam_user_ssh_key ? 1 : 0
  username   = aws_iam_user.this[0].name
  encoding   = var.module_ssh_key_encoding
  public_key = var.module_ssh_public_key
}