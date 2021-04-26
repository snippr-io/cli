# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Snippr < Formula
  desc ""
  homepage ""
  version "0.5.3"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/snippr-io/homebrew-cli/releases/download/0.5.3/snippr-darwin-amd64.tar.gz"
    sha256 "d672ba7fa442060bc5830c4fb2d389f351e4fc75fb34949686212e89908f8132"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/snippr-io/homebrew-cli/releases/download/0.5.3/snippr-linux-amd64.tar.gz"
    sha256 "97b89aa7d53885ae5c915023a028235d8fdd42b9c66627e921f9ad7a9e70111b"
  end

  def install
    bin.install "snippr"
  end
end
