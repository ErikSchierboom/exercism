def transform(legacy_data):
    return { letter.lower(): score
             for score, letters in legacy_data.items()
             for letter in letters } 
