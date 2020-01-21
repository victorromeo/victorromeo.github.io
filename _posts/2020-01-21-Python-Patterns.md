---
layout: post
title: "Python patterns"
date: 2020-01-21
tags: python environment
image: https://images.unsplash.com/photo-1513563568283-f43b7e3d8de5
thumb: https://images.unsplash.com/photo-1513563568283-f43b7e3d8de5?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@davidclode
type: spec
---

A list of common Python operations, which are typically useful in machine maintenance and application architecture

## Python Module and Package Inspection

Syntax | Description
---|---
`help(modulename)` | Get all the documents at once interactively
`print(dir(modulename))` | Get list of functions and variables

### Inspect

[Inspect](https://docs.python.org/3/library/inspect.html) provides a complete API for getting a modules content definitions and declarations

```python
from inspect import getmembers, isfunction
import helloworld
print [o for o in getmembers(helloworld) if isfunction(o[1])]
['hello_world']
```

### Loop through attributes

```python
import types
import yourmodule

print([getattr(yourmodule, a) for a in dir(yourmodule)
  if isinstance(getattr(yourmodule, a), types.FunctionType)])
```

### PYDOC

Generate HTML to view externally, from the command line

```bash
pydoc sys
```

## CRON

[source](https://pypi.org/project/python-crontab/)

```bash
from crontab import CronTab

empty_cron = CronTab()
my_cron = CronTab(user=True)
user_cron = CronTab(user='username')
file_cron = CronTab('file.tab')
mem_cron = CronTab("""* * * * * command """"")
```

### Jobs

```python
# Create
job = cron.new(command='/path/to/command args') # Create
#or
job2 = cron.new(command='/path/to/command args', comment='Job ID or Comment')

# Write
cron.write()
# Write to file
cron.write('/path/to/write')
# Write to user
cron.write_to_user(user='username')

# Enable
job.enable()
# Disable
job.enable(false)

# Is Enabled
enabled = job.is_enabled()
# Validation
valid = job.is_valid()

# Modify
job.set_command('/path/to/new/command args')
job.set_comment('New Job ID or Comment Here')

# Fetch job - By command using regular expressions
job = cron.find_command('bar') # Matches foobar
job = cron.find_command(re.compile(r'b[ab]r$'))

# Fetch job - By ID or comment using regular expressions
job = cron.find_comment('ID or comment text')
job = cron.find_comment(re.compile(' or \w'))

# Fetch job - By schedule
iter = cron.find_time(2, 10, '2-4', '*/2', None)
iter = cron.find_time("*/2 * * * *")

# Fetch detail
command = job.command # Fetch command
comment = job.comment # Fetch comment

# Remove All Jobs
cron.remove_all()
#Remove Job
cron.remove(job)
# Remove All Jobs by command
cron.remove('bar') # Removes foobar
# Remove All Jobs with comment
cron.remove(comment='bar') # Removes comment with foobar
#Remove All Jobs by time
cron.remove(time='*/2') # Removes any job with a '*/2' restriction on any field
```

### Restrictions

Syntax | Description | Equivalent
---|---|----
`job.minute.every(5)` | Every 5 minutes | `*/5 * * * *`
`job.minute.during(10,30).every(5)` | Every 5 minutes, between 10 and 30 minutes passed the hour | `10-30/5 * * * *`
`job.hour.on(14)` | At 2pm every day | `* 14 * * *`
`job.hour.every(10)` | Every 10 hours | `* */10 * * *`
`job.day.on(4, 5, 6)` | On 4,5 and 6 of month | `* * 4,5,6 * *`
`job.month.during('APR', 'NOV')` | Every minute during April and November | `* * * 4,11 *`
`job.month.during('APR', 'NOV')` | Every minute during April and November | `* * * 4,11 *`
`job.dow.on('SUN','FRI')` | On Sundays and Fridays | `* * * * 0,4`

Restrictions can be expressed using

- `on(a)` Specific value
- `every(a)` Rolling increment
- `during(a-b)` Range value

### Comparison

```python
Compare Crons
difference = set([CronItem1, CronItem2, CronItem3]) - set([CronItem2, CronItem3])

CronItem1 = CronTab(tab="* * * * * COMMAND # Example Job")
CronItem2 = CronTab(tab="10 * * * * COMMAND # Example Job 2")
if CronItem1 != CronItem2:
    print("Cronjobs do not match")
```

### Log

```python
cron = CronTab(user='root')

# For all commands
for d in cron.log:
    print("{0} - {1}".format(d['pid'],d['date']))

# For a specific command
for d in cron.find_command('echo')[0].log:
    print("{0} - {1}".format(d['pid'],d['date']))
```

### Scheduler (Experimental)

```python
file_cron = CronTab(tabfile='tabfile.tab')

# Run Scheduler
for result in file_cron.run_scheduler():
  print('Message')

# Run Scheduler for a limited time
for result in tab.run_scheduler(timeout=600):
    print("Will run jobs every 1 minutes for ten minutes from now() {0}".format(result))

# Run Scheduler, but speed up the scheduler time
for result in tab.run_scheduler(cadence=1, warp=True):
    print("Will run jobs every 1 second, counting each second as 1 minute {0}".format(result))
```
