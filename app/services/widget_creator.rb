class WidgetCreator
  def create_widget(widget)
    widget.widget_status = WidgetStatus.find_by!(name: "Fresh")
    widget.save

    Result.new(created: widget.valid?, widget: widget)
  end
end

class Result
  attr_reader :widget
  def initialize(created:, widget:)
    @created = created
    @widget = widget
  end

  def created?
    @created
  end
end
