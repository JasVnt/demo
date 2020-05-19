from django.shortcuts import render

from django.http import HttpResponse,JsonResponse
from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from . models import employees
from .serializers import employeesSerializer
from rest_framework.decorators import api_view
# Create your views here.

@api_view(['GET'])
def apioverview(request):
    api_urls = {
        'List':'task-list',
    }
    return Response(api_urls)

@api_view(['GET'])
def printemployees(request):
    emp = employees.objects.all()
    serializer = employeesSerializer(emp,many=True)
    return Response(serializer.data)

@api_view(['GET'])
def printspecific(request,pk):
    emp = employees.objects.get(id=pk)
    serializer = employeesSerializer(emp,many=False)
    return Response(serializer.data)

@api_view(['POST'])
def addemployee(request):

    serializer = employeesSerializer(data=request.data)

    if serializer.is_valid():
        serializer.save()

    return Response(serializer.data)

