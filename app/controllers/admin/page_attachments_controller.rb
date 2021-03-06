class Admin::PageAttachmentsController < Admin::ResourceController
  
  def index
    collection = self.respond_to?(:current_site) ? current_site.page_attachments : PageAttachment
    @attachments = collection.all(:conditions => {:parent_id => nil}, :include => [:page], :order => 'title, filename').paginate(@pagination_parameters)
  end
  
  def grid
    collection = self.respond_to?(:current_site) ? current_site.page_attachments : PageAttachment
    @attachments = collection.all(:conditions => {:parent_id => nil}, :include => [:page], :order => 'title, filename').paginate(@pagination_parameters)
  end
  
  def update
    @page_attachment = PageAttachment.find(params[:id])
    params[:page_attachment].each do |k,v|
      @page_attachment[k] = v
    end
    @page_attachment.save!
    response_for :update
  end
  
end