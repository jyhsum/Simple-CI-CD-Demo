"""Tests for demo."""
from django.urls import resolve
from django.test import SimpleTestCase
from demo.views import hello_view

# Create your tests here.
class UrlTest(SimpleTestCase):
    """test for url."""

    def test_demo_url(self):
        """test for url."""
        response = self.client.get('/hello')
        match = resolve('/hello')

        self.assertEqual(match.route, 'hello')
        self.assertEqual(
                    match.func.__code__,
                    hello_view.as_view().__code__)
        self.assertContains(response, 'ok')
