module StoriesHelper

  # def grab_data_for_journalist(journalist)
  #   all_instances = []
  #   all_instances << journalist.stories
  #   all_instances << journalist.comments
  #   all_instances.flatten!
  #   all_instances.sort_by{ |instance| instance.created_at}.reverse
  # end

  def grab_data_for_journalist(journalist)
    all_instances = []
    all_instances << journalist.stories
    all_instances << journalist.comments
    all_instances.flatten!
    all_instances.sort_by do |instance|
      instance.class == Story ? instance.date_published : instance.created_at
    end.reverse
  end

end
