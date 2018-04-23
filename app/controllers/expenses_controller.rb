class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = current_user.expenses
    @weekly_subs = weekly_subs
    @monthly_subs = monthly_subs
    @annual_subs = annual_subs
    @weekly_cc = weekly_cc_payment
    @annual_cc = annual_cc_payment
    @total_monthly_payment = total_monthly_payment
    @total_monthly_expense = total_monthly_expenses
    @total_annual_expenses = total_annual_expenses
    @total_weekly_expenses = total_weekly_expenses
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = current_user.expenses.build
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = current_user.expenses.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:name, :amount, :frequency, :user_id, :expense_category_id)
    end
end
