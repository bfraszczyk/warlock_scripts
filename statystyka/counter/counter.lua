---wiekszosc kodu pobrana z https://github.com/tjurczyk/arkadia, przerobione na potrzeby warlocka
scripts.counter = scripts.counter or {}
scripts.counter2 = scripts.counter2 or {}
scripts.counter["killed"] = scripts.counter["killed"] or {}
scripts.counter["killed_amount"] = scripts.counter["killed_amount"] or {}
scripts.counter["all_kills"] = scripts.counter["all_kills"] or 0
scripts.counter.killed_amount["JA"] = scripts.counter.killed_amount["JA"] or 0

-- counter2
scripts.counter2["db_log"] = db:create("counter2_log", {
    counter2_log = {
        year = 0,
        month = 0,
        day = 0,
        hour = "",
        text = "",
        character = "",
        changed = db:Timestamp("CURRENT_TIMESTAMP")
    }
})

scripts.counter2["db_daysum"] = db:create("counter2_daysum", {
    counter2_daysum = {
        year = 0,
        month = 0,
        day = 0,
        type = "",
        character = "",
        amount = 0,
    }
})


