function subjectID = MakeSubjectID

subjectID = [sprintf('%06d',round(rand * 100000)) datestr(now(),'hhmmssDDMMYY')];