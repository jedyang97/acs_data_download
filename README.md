# Assignment 1 Data Collection and ETL

## 0. Install the dependencies
Run:
```angular2
virtualenv -p python3.6 venv
source venv/bin/activate
pip install -r requirements.txt
```


## 1. Get Data

Run:
```angular2
sh get_data.sh
```

## 2. Transform/Prep

Run:
```angular2
sh transform.sh
```

## 3. Load

Run:
```angular2
sh load.sh
```