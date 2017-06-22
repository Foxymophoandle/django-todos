# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class Todo(models.Model):

    text = models.TextField()
    done = models.BooleanField(default=False)

    def __unicode__(self):
        return self.text
