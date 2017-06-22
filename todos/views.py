# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from rest_framework import viewsets

from todos.models import Todo
from todos.serializers import TodoSerializer


class TodoViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Todo.objects.all().order_by('id')
    serializer_class = TodoSerializer
