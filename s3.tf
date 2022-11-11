resource "aws_s3_bucket" "bucket" {
  bucket = var.hosting-bucket
}

resource "aws_s3_bucket_website_configuration" "hosting" {
  bucket = aws_s3_bucket.bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_object" "html_upload_object" {
  bucket = aws_s3_bucket.bucket.id
  source = "index.html"
  key    = "index.html"
  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag         = filemd5("index.html")
  content_type = "text/html"

  depends_on = [
    aws_s3_bucket.bucket,
  ]
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = templatefile("s3-hosting-plcy.tpl", { bucket_name = var.hosting-bucket })
}

data "aws_route53_zone" "zone" {
  name = "trainer.aws.zhtraining.de"
}

resource "aws_route53_record" "website-record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "www.trainer.aws.zhtraining.de"
  type    = "A"
  alias {
    name                   = aws_s3_bucket.bucket.website_endpoint
    zone_id                = aws_s3_bucket.bucket.hosted_zone_id
    evaluate_target_health = false
  }
}
