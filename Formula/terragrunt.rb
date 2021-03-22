class Terragrunt < Formula
  desc "Thin wrapper for Terraform e.g. for locking state"
  homepage "https://terragrunt.gruntwork.io/"
  url "https://github.com/gruntwork-io/terragrunt/archive/v0.28.15.tar.gz"
  sha256 "f6db3948a64fd388e48b326a3a60adde700cf18fa04a5110de887c6d9f19fd10"
  license "MIT"

  bottle do
    root_url "https://github.com/bingtsingw/homebrew-tap/releases/download/terragrunt-0.28.15"
    sha256 cellar: :any_skip_relocation, catalina:     "3ecf88226dfaa4181832c08bbe4ce547adb7d25f4801a95ca4429c34b83a14f8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a6537e4f583de66c6f463cc5a542488b63e733fc8a233dc7663700b7e69dd41c"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w -X main.VERSION=v#{version}", *std_go_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/terragrunt --version")
  end
end
