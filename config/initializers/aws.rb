Aws.config[:credentials] = Aws::Credentials.new(
  ENV['BUCKETEER_AWS_ACCESS_KEY_ID'],
  ENV['BUCKETEER_AWS_SECRET_ACCESS_KEY'],
  s3_region: ENV['AWS_REGION']
)
Aws.config[:region] = 'eu-west-1'

S3 = Aws::S3::Client.new
