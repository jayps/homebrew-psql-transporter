class PsqlTransporter < Formula
  desc "CLI to export/import Postgres databases safely"
  homepage "https://github.com/jayps/psql-transporter"
  license "MIT"
  version "1.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jayps/psql-transporter/releases/download/v1.1.1/psql-transporter_v1.1.1_darwin_arm64.tar.gz"
      sha256 "aa413a24b95ea09a2030286ce570607921feaf87168e525e05bdd41e5195c47e"
    else
      url "https://github.com/jayps/psql-transporter/releases/download/v1.1.1/psql-transporter_v1.1.1_darwin_amd64.tar.gz"
      sha256 "5ee95da3ffa07eaef226918d331792aeb90b6028aa0619f901112cb8008c272a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jayps/psql-transporter/releases/download/v1.1.1/psql-transporter_v1.1.1_linux_arm64.tar.gz"
      sha256 "c27271e287ee7031fdb68d5021a3bf47e7704db8e79c95c65c26ba593cb8d8c5"
    else
      url "https://github.com/jayps/psql-transporter/releases/download/v1.1.1/psql-transporter_v1.1.1_linux_amd64.tar.gz"
      sha256 "a45001b69a21e216720e818fab1e675c111ae86182a45e2f839f9cd59669a00e"
    end
  end

  def install
    bin_path = Dir["**/psql-transporter"].first
    odie "psql-transporter binary not found in archive" if bin_path.nil?
    bin.install bin_path => "psql-transporter"
  end

  test do
    system "#{bin}/psql-transporter", "--version"
  end
end