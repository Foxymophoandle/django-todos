#!/usr/bin/env python
from rest_framework import serializers

from todos.models import Todo

__author__ = 'davide'
__date__ = ' 20 June 2017'


class TodoSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Todo
        fields = ('text', 'done')
