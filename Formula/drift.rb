class Drift < Formula
  desc "Ticket-based git TUI"
  homepage "https://github.com/Sknoww/drift"
  url "https://github.com/Sknoww/drift/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "daee5bb304a7d6c78629b0ce2b172605f70cc5c8bdce66e45f4f8d679fbabf9b"
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
