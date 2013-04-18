class AccountsController < ApplicationController

  before_filter :authenticate_user!

  # GET /accounts
  # GET /accounts.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = @accounts.find(params[:id])
    @invoiced_entries = @time_entries.invoiced?.where(:account_id => @account.id).order("date DESC")
    @open_entries = @time_entries.invoiced!.where(:account_id => @account.id).order("date DESC")
    @time_entry = TimeEntry.new
    @new_invoice = Invoice.new
    respond_to do |format|
      if !@account.nil?
        format.html # show.html.erb
        format.json { render json: @account }
      else
        format.html { redirect_to :action => "index" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end

    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = @accounts.find(params[:id])
    respond_to do |format|
      if !@account.nil?
        format.html # edit.html.erb
      else
        format.html { redirect_to :action => "index" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end

    end
  end

  # POST /accounts
  # POST /accounts.json
  def create

    @account = Account.new(params[:account])
    respond_to do |format|
      if @account.save && UserAccount.create({"user_id" => current_user.id, "account_id" => @account.id})
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = @accounts.find(params[:id])

    respond_to do |format|
      if !@account.nil? && @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end
end
