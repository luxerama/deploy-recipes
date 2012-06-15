# load the libraries
require 'aws'
# # log requests using the default rails logger
# AWS.config(:logger => Rails.logger)

def aws_ec2_role(which, *args, &block)
  
  options = args.last.is_a?(Hash) ? args.pop : {}
  
  # validate EC2 settings
  _cset(:access_key_id) { Capistrano::CLI.ui.ask("Enter your AWS access key ID: ") }
  _cset(:secret_access_key) { Capistrano::CLI.ui.ask("Enter your AWS secret key: ") }
  
  AWS.config :access_key_id => access_key_id, :secret_access_key => secret_access_key 
  
  ec2 = AWS::EC2.new
  # optionally switch to a non-default region
  if region = options[:region]
    region = ec2.regions[region]
    unless region.exists?
      raise "Requested region '#{region.name}' does not exist.  Valid regions: \n #{ec2.regions.map(&:name).join("\n  ")}"
    end
    # a region acts like the main EC2 interface
    ec2 = region
  end
  
  query = {}
  
  instances = AWS.memoize do
    query = {}
    # Filter by tags
    if tags = options[:tags]      
      args.delete :tags
      ec2.instances.select do |i|
        r = false
        tags.each do |key, value|
          if value
            r = i.tags.to_h[key.to_s] == value
          else
           r = i.tags.to_h.has_key? key.to_s
         end
        end
        r
      end
    end
  end
  # @TODO we need to make sure we merge the dns names with the other args
  args = instances.map {|i| i.dns_name}
  role which, *args
end
