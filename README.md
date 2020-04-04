# fnn-docker-weasyprint

Tiny base image for WeasyPrint.

## Run

This image can be used as base image for WeasyPrint applications. If you want to test it run image with volume. Created pdf file will be located at `<local/path>`.

```bash
docker run --name=weasyprint -v <local/path>:/pdf fnn-docker-weasyprint:51  weasyprint http://google.com ./pdf/weasyprint-google.pdf
```
