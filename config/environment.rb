# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# ローカルストレージを使用
# Active Storageの設定
Rails.application.configure do
    config.active_storage.service = :local
  end