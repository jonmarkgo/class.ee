module ApplicationHelper
  def current_class?(test_path)
    return 'current' if request.request_uri == test_path
    ''
  end
end
