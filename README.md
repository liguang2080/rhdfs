# Rhdfs

hdfs 客户端 基于jruby

## Installation

Add this line to your application's Gemfile:

    gem 'rhdfs'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rhdfs

## Usage

	自带的jar为hadoop1.2.1的jar
	如果要使用其他版本，把lib/jars里面的替换为相应的hadoop的就可以了(包含hadoop目录下与hadoop/lib下面的jar一起拷贝过来就可以了)

	client =  Rhdfs::Client.new("hdfs://localhost:9000")

	上传
	client.upload_file "./1.png, "uploads/1.png"

	列表显示
	client.ls("./uploads")

	下载
	client.download_file("uploads/1.png", "1.png.bak")

	删除
	client.del "uploads/1.png"

## Contributing

1. Fork it ( http://github.com/<my-github-username>/rhdfs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
