Aws.config[:credentials] = Aws::Credentials.new(
  ENV['BUCKETEER_AWS_ACCESS_KEY_ID'],
  ENV['BUCKETEER_AWS_SECRET_ACCESS_KEY'],
)
Aws.config[:region] = ENV['AWS_REGION']

S3 = Aws::S3::Client.new
