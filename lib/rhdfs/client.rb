java_import org.apache.hadoop.conf.Configuration
java_import org.apache.hadoop.fs.FileSystem
java_import org.apache.hadoop.fs.FileStatus
java_import org.apache.hadoop.fs.Path
java_import org.apache.hadoop.fs.FileUtil

java_import java.io.FileOutputStream
java_import java.io.FileInputStream
java_import org.apache.hadoop.io.IOUtils

java_import java.io.BufferedInputStream

module Rhdfs
  class Client
    def initialize(url)
      @url = url
      @fs = FileSystem.get(java.net.URI.new(url), Configuration.new)
    end

    def ls(dir = ".")
      status = @fs.list_status [Path.new(dir)].to_java(Path)
      list_paths = FileUtil.stat2_paths(status)
      list_paths.map(&:to_s)
    end

    def cp_to_local(hdfs_src, dst)
      out_stream = FileOutputStream.new(dst)
      in_stream = @fs.open(Path.new(hdfs_src))
      begin
        IOUtils.copy_bytes(in_stream, out_stream, 40960, false)
      rescue Exception => e
      ensure
        IOUtils.close_stream in_stream
      end
      true
    end

    def del(path)
    	@fs.delete Path.new(path), false
    end

    def upload_file(local_src, dst)
    	in_stream = BufferedInputStream.new(FileInputStream.new(local_src))
    	out_stream = @fs.create(Path.new(dst))
    	IOUtils.copy_bytes(in_stream, out_stream, 4096, true)
    	true
    end
  end
end
