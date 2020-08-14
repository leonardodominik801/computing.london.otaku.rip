#!/usr/bin/env python3
#-*- coding: utf-8 -*-
from os import listdir
from os.path import isfile, join

def header():
    text = '---\n'
    text += 'layout: blank\n'
    text += 'title: Computing.London\n'
    text += 'charset: utf-8\n'
    text += 'description: A distance learning programme studying computers.\n'
    text += 'url: https://computing.london.otaku.rip/\n'
    text += 'locale: en_US\n'
    text += 'type: website\n'
    text += 'site_name: computing.london\n'
    text += '---\n\n'
    return text

def subject_guides():
    text = '## Subject Guides\n\n'
    for sg in sorted(listdir('sg')):
        text += ' * [{0}](/sg/{0})\n'.format(sg)
    text += '\n'
    return text

def courseworks():
    text = '## Coursework Assignments and Commentaries\n\n'
    for subj in sorted(listdir('cw')):
        for yr in sorted(listdir('cw/{0}'.format(subj))):
            for cw in sorted(listdir('cw/{0}/{1}'.format(subj, yr))):
                text += ' * [{0} >> {1} >> {2}](/cw/{0}/{1}/{2})\n'.format(subj, yr, cw)
    text += '\n'
    return text

def past_papers():
    text = '## Past Exam Papers & Commentaries\n\n'
    for subj in sorted(listdir('pp')):
        for yr in sorted(listdir('pp/{0}'.format(subj))):
            for pp in sorted(listdir('pp/{0}/{1}'.format(subj, yr))):
                text += ' * [{0} >> {1} >> {2}](/pp/{0}/{1}/{2})\n'.format(subj, yr, pp)
    text += '\n'
    return text

def all():
    text = header()
    text += subject_guides()
    text += courseworks()
    text += past_papers()
    return text

print(all())
