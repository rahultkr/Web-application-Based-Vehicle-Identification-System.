from flask import Flask,render_template,request,session,redirect,url_for,flash
from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin
from sqlalchemy import PrimaryKeyConstraint
from werkzeug.security import generate_password_hash,check_password_hash
from flask_login import login_user,logout_user,login_manager,LoginManager
from flask_login import login_required,current_user
import json

# MY db connection
local_server= True
app = Flask(__name__)
app.secret_key='dbmsproject'


# this is for getting unique user access
login_manager=LoginManager(app)
login_manager.login_view='login'

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

# app.config['SQLALCHEMY_DATABASE_URL']='mysql://username:password@localhost/databas_table_name'

app.config['SQLALCHEMY_DATABASE_URI']='mysql://root:@localhost/vehicles'
db=SQLAlchemy(app)

# here we will create db models that is tables

class Test(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(100))
    email=db.Column(db.String(100))

class User(UserMixin,db.Model):
    id=db.Column(db.Integer,primary_key=True)
    username=db.Column(db.String(50))
    email=db.Column(db.String(50),unique=True)
    password=db.Column(db.String(1000))

class Identification(db.Model):
    Driving_License_No=db.Column(db.String(20),primary_key = True)
    FullName=db.Column(db.String(50))
    Address=db.Column(db.String(50))
    DoB=db.Column(db.String(12))
    Mobile_No=db.Column(db.Integer)
    Valid_Till=db.Column(db.String(12))
    Vehicle_RC_No=db.Column(db.String(20))

class Emission(db.Model):
    Vehicle_RC_No=db.Column(db.String(20),primary_key = True)
    Vehicle_Type=db.Column(db.String(20))
    Fuel_Type=db.Column(db.String(20))
    PUC_SNo=db.Column(db.String(20))
    Manufacture_Date=db.Column(db.String(12))
    PUC_Valid_Till=db.Column(db.String(12))




@app.route('/')
def index(): 
    return render_template('index.html')

@app.route('/addvehicle',methods=['POST','GET'])
@login_required
def addvehicle():
    if request.method=="POST":
        Driving_License_No=request.form.get('Driving_License_No')
        FullName=request.form.get('FullName')
        Address=request.form.get('Address')
        DoB=request.form.get('DoB')
        Mobile_No=request.form.get('Mobile_No')
        Valid_Till=request.form.get('Valid_Till')
        Vehicle_RC_No=request.form.get('Vehicle_RC_No')
        
        query=db.engine.execute(f"INSERT INTO `Identification` (`Driving_License_No`,`FullName`,`Address`,`DoB`,`Mobile_No`,`Valid_Till`,`Vehicle_RC_No`) VALUES ('{Driving_License_No}','{FullName}','{Address}','{DoB}','{Mobile_No}','{Valid_Till}','{Vehicle_RC_No}')")
    

        flash("Booking Confirmed","info")


    return render_template('addvehicle.html')

@app.route('/search',methods=['POST','GET'])
@login_required
def search():
    if request.method=="POST":
        Vehicle_RC_No=request.form.get('Vehicle_RC_No')
        bio=Identification.query.filter_by(Vehicle_RC_No=Vehicle_RC_No).first()
        
        return render_template('search.html',bio=bio)
        
    return render_template('search.html')

@app.route('/PUCdetails',methods=['POST','GET'])
@login_required
def PUCdetails():
    if request.method=="POST":
        Vehicle_RC_No=request.form.get('Vehicle_RC_No')
        bio=Emission.query.filter_by(Vehicle_RC_No=Vehicle_RC_No).first()
        

        return render_template('PUCdetails.html',bio=bio)
        
    return render_template('PUCdetails.html')



@app.route('/signup',methods=['POST','GET'])
def signup():
    if request.method == "POST":
        username=request.form.get('username')
        email=request.form.get('email')
        password=request.form.get('password')
        user=User.query.filter_by(email=email).first()
        if user:
            flash("Email Already Exist","warning")
            return render_template('/signup.html')
        encpassword=generate_password_hash(password)

        new_user=db.engine.execute(f"INSERT INTO `user` (`username`,`email`,`password`) VALUES ('{username}','{email}','{encpassword}')")

        # this is method 2 to save data in db
        # newuser=User(username=username,email=email,password=encpassword)
        # db.session.add(newuser)
        # db.session.commit()
        flash("Signup Succes Please Login","success")
        return render_template('login.html')

          

    return render_template('signup.html')

@app.route('/login',methods=['POST','GET'])
def login():
    if request.method == "POST":
        email=request.form.get('email')
        password=request.form.get('password')
        user=User.query.filter_by(email=email).first()

        if user and check_password_hash(user.password,password):
            login_user(user)
            flash("Login Success","primary")
            return redirect(url_for('index'))
        else:
            flash("invalid credentials","danger")
            return render_template('login.html')    

    return render_template('login.html')


@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash("Logout SuccessFul","warning")
    return redirect(url_for('login'))

@app.route('/test')
def test():
    try:
        Test.query.all()
        return 'My database is Connected'
    except:
        return 'My db is not Connected'



app.run(debug=True)    