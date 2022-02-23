resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  count = var.bucket_website == true ? 1 : 0

  bucket = aws_s3_bucket.s3_bucket.bucket

  index_document {
    suffix = var.bucket_website_index_document
  }

  error_document {
    key = var.bucket_website_error_document
  }

  #routing_rule = var.bucket_website_routing_rule
  # dynamic "routing_rule" {
  #       for_each = rule.value["expiration"]
  #       content {
  #         date = expiration.value["date"]
  #         days = expiration.value["days"]
  #         expired_object_delete_marker = expiration.value["expired_object_delete_marker"]
  #       }
  #     }
}
