class Drift < Formula
  desc "Ticket-based git TUI"
  homepage "https://github.com/Sknoww/drift"
  url "https://github.com/Sknoww/drift/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e8549acbfa33fa5791e121fd1960e7334d5310daa790d49320205771e7b9cee0"
  license "MIT"
  head "https://github.com/Sknoww/drift.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/drift -version")
  end
end
